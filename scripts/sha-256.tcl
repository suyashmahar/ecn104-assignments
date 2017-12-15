 # sha-256.tcl
 # SHA-256 hash algorithm
 #
 # Lino Monaco - Feb 2006
 # _________________________________________


 proc sha256_init {} {
   global K
   global h0 h1 h2 h3 h4 h5 h6 h7
   
   # Set the SHA-256 constants  
   set K {0x428a2f98 0x71374491 0xb5c0fbcf 0xe9b5dba5 \
          0x3956c25b 0x59f111f1 0x923f82a4 0xab1c5ed5 \
          0xd807aa98 0x12835b01 0x243185be 0x550c7dc3 \
          0x72be5d74 0x80deb1fe 0x9bdc06a7 0xc19bf174 \
          0xe49b69c1 0xefbe4786 0x0fc19dc6 0x240ca1cc \
          0x2de92c6f 0x4a7484aa 0x5cb0a9dc 0x76f988da \
          0x983e5152 0xa831c66d 0xb00327c8 0xbf597fc7 \
          0xc6e00bf3 0xd5a79147 0x06ca6351 0x14292967 \
          0x27b70a85 0x2e1b2138 0x4d2c6dfc 0x53380d13 \
          0x650a7354 0x766a0abb 0x81c2c92e 0x92722c85 \
          0xa2bfe8a1 0xa81a664b 0xc24b8b70 0xc76c51a3 \
          0xd192e819 0xd6990624 0xf40e3585 0x106aa070 \
          0x19a4c116 0x1e376c08 0x2748774c 0x34b0bcb5 \
          0x391c0cb3 0x4ed8aa4a 0x5b9cca4f 0x682e6ff3 \
          0x748f82ee 0x78a5636f 0x84c87814 0x8cc70208 \
          0x90befffa 0xa4506ceb 0xbef9a3f7 0xc67178f2 }
   # ... and initial hash value
   set h0 0x6a09e667 
   set h1 0xbb67ae85 
   set h2 0x3c6ef372 
   set h3 0xa54ff53a
   set h4 0x510e527f 
   set h5 0x9b05688c 
   set h6 0x1f83d9ab 
   set h7 0x5be0cd19
 }
 
 # SHA-256 logical functions ___________________________________________________ 
 proc Ch {x y z} {
   return [expr {($x & $y) ^ (~($x) & $z)}]
 }
 
 proc Maj {x y z} {
   return [expr {($x & $y) ^ ($x & $z) ^ ($y & $z)}]
 }
 
 proc SIGMA_0 {x} {
   set a [expr {(($x >> 2) & 0x3FFFFFFF) | (($x << (32 - 2)) & 0xFFFFFFFF)}]
   set b [expr {(($x >> 13) & 0x0007FFFF) | (($x << (32 - 13)) & 0xFFFFFFFF)}]
   set c [expr {(($x >> 22) & 0x000003FF) | (($x << (32 - 22)) & 0xFFFFFFFF)}]        
   return [expr {$a ^ $b ^$c}]
 } 
 
 proc SIGMA_1 {x} {
   set a [expr {(($x >> 6) & 0x03FFFFFF) | (($x << (32 - 6)) & 0xFFFFFFFF)}]
   set b [expr {(($x >> 11) & 0x001FFFFF) | (($x << (32 - 11)) & 0xFFFFFFFF)}]
   set c [expr {(($x >> 25) & 0x0000007F) | (($x << (32 - 25)) & 0xFFFFFFFF)}]
   return [expr {$a ^ $b ^$c}]
 } 
 
 proc sigma0 {x} {
   set a [expr {(($x >> 7) & 0x01FFFFFF) | (($x << (32 - 7)) & 0xFFFFFFFF)}]
   set b [expr {(($x >> 18) & 0x00003FFF) | (($x << (32 - 18)) & 0xFFFFFFFF)}]
   set c [expr {($x >> 3) & 0x1FFFFFFF}]
   return [expr {$a ^ $b ^$c}]
 }
 
 proc sigma1 {x} {
   set a [expr {(($x >> 17) & 0x00007FFF) | (($x << (32 - 17)) & 0xFFFFFFFF)}]
   set b [expr {(($x >> 19) & 0x00001FFF) | (($x << (32 - 19)) & 0xFFFFFFFF)}]
   set c [expr {($x >> 10) & 0x003FFFFF}]
   return [expr {$a ^ $b ^$c}]
 }
 #______________________________________________________________________________
 
 proc sha256_pad {msg len} {
   # Padding function: works only with messages that have a byte-aligned length
   # "len" is the total bytes length of whole message
   
   # append the value 0x80 to message
   #
   append msg [binary format c 0x80]
   
   # append "0" bits until the message length is equal to 64 - 8 - 1 bytes
   #
   set mlen [expr {($len + 8 + 1) % 64}]
   while {$mlen < 64} {
     append msg [binary format c 0x0]
     incr mlen
   }
   
   # append a 64-bits big-endian integer giving the original message length (in bits)
   #
   append msg [binary format W [expr {$len*8}]]
   return $msg
 }
 
 proc sha256_round {msg} {
   global K
   global h0 h1 h2 h3 h4 h5 h6 h7
 
   # Divide the message into 32-bits integer
   #
   binary scan $msg I* crunch
   set len [llength $crunch]
   
   # Work 16 integers at a time
   #
   for {set i 0} {$i < $len} {incr i 16} { 
 
     # Prepare the message scheduler
     #
     set W {}
     for {set j 0} {$j < 16} {incr j} {
       lappend W [lindex $crunch [expr {$i + $j}]]
     }        
     for {set j 16} {$j < 64} {incr j} {
       set W15 [lindex $W [expr {$j - 15}]]
       set W2  [lindex $W [expr {$j - 2}]]
       set W16 [lindex $W [expr {$j - 16}]]
       set W7  [lindex $W [expr {$j - 7}]]
       set s0  [sigma0 $W15]
       set s1  [sigma1 $W2]
       lappend W [expr {($W16 + $s0 + $W7 + $s1) & 0xFFFFFFFF}]
     }
 
     # Initialize the working variables        
     #
     set a $h0
     set b $h1
     set c $h2
     set d $h3
     set e $h4
     set f $h5
     set g $h6
     set h $h7
 
     # 64 Hash rounds
     #
     for {set j 0} {$j < 64} {incr j} {        
       set s0 [SIGMA_0 $a]
       set maj [Maj $a $b $c]
       set t0 [expr {($s0 + $maj) & 0xFFFFFFFF}]
       set s1 [SIGMA_1 $e]
       set ch [Ch $e $f $g]
       set Kj [lindex $K $j]
       set Wj [lindex $W $j]
       set t1 [expr {($h + $s1 + $ch + $Kj + $Wj) & 0xFFFFFFFF}]
 
       set h $g
       set g $f
       set f $e
       set e [expr { ($d + $t1) & 0xFFFFFFFF}]
       set d $c
       set c $b
       set b $a
       set a [expr {($t0 + $t1) & 0xFFFFFFFF}] 
     }
 
     # Compute the intermediate hash value
     #
     set h0 [expr {($h0 + $a) & 0xffffffff}]
     set h1 [expr {($h1 + $b) & 0xffffffff}] 
     set h2 [expr {($h2 + $c) & 0xffffffff}]
     set h3 [expr {($h3 + $d) & 0xffffffff}]
     set h4 [expr {($h4 + $e) & 0xffffffff}]
     set h5 [expr {($h5 + $f) & 0xffffffff}]
     set h6 [expr {($h6 + $g) & 0xffffffff}] 
     set h7 [expr {($h7 + $h) & 0xffffffff}]
   }
 }

 proc sha256_end {} {
   global h0 h1 h2 h3 h4 h5 h6 h7
   
   # format the hashing value        
   #
   set h0 [format %08X $h0]
   set h1 [format %08X $h1] 
   set h2 [format %08X $h2]
   set h3 [format %08X $h3]
   set h4 [format %08X $h4]
   set h5 [format %08X $h5]
   set h6 [format %08X $h6] 
   set h7 [format %08X $h7]
 
   return "$h0 $h1 $h2 $h3 $h4 $h5 $h6 $h7"
 }
 proc sha256 {msg} {
   
   # glue all the work
   #
   sha256_init
   set msg [sha256_pad $msg [string bytelength $msg]]
   sha256_round $msg
   sha256_end
 }

