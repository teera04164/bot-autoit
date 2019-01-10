
HotKeySet("{=}", "start")
HotKeySet("{-}", "wait")
HotKeySet("{`}", "stop")
HotKeySet("{\}", "dell")

While 1
    Sleep(100)
 WEnd




Func start()
   Global $a = "Hello world"
   ConsoleWrite("infunc"& @LF)

   ConsoleWrite($a & @LF)
   Global $speed = 2
   Global $speedDell = 5
   Global $beforCut = 5;
   Global $all = ""
   Global $between = 6;
   $sec = 420;
   $sum = 0;

   For $i = $sum To 100000 Step +1
	  MouseClick("left",1699, 538,1,$speed)

	  If Mod($i, 2) = 0 Then
		 $sum += $between;
		 If $sum >= 60 Then
			$hour =  Floor($sum / 3600)
			$min =  Floor(Mod($sum, 3600)/60)
			$sec =  Floor(Mod($sum, 60))
			If $min <= 9 Then
			   $min =  "0"&String($min)
			EndIf
			If $sec <= 9 Then
			   $sec =  "0"&String($sec)
			EndIf

			$all =  String($hour)&String($min)&String($sec)&"00"
		   click()

		Else
		   $temp = $sum *100
		   ConsoleWrite($temp& @LF)
		    MouseClick("left",1819, 549,1,$speed)
		   Send($temp)
		EndIf

	   Else
		 $sum +=14
		If $sum >= 60 Then
			$hour =  Floor($sum / 3600)
			$min =  Floor(Mod($sum, 3600)/60)
			$sec =  Floor(Mod($sum, 60))
			If $min <= 9 Then
			   $min =  "0"&String($min)
			EndIf
			If $sec <= 9 Then
			   $sec =  "0"&String($sec)
			EndIf
			$all =  String($hour)&String($min)&String($sec)&"00"
			click()
		Else
		   $temp = $sum *100
			 ConsoleWrite($temp& @LF)
		     MouseClick("left",1819, 549,1,$speed)
		   Send($temp)
		EndIf
	 EndIf
	  Sleep($beforCut)
	  MouseClick("left",1699, 538,1,$speed)
	  MouseClick("left",187, 589,1,$speed)

   Next


   EndFunc



   Func dell()
   ConsoleWrite("infunc"& @LF)

   Global $all = ""
   $sec = 420;
   $sum = 0;

   For $i = $sum To 100000 Step +1
	  MouseClick("left",1699, 538,1,$speedDell)

	  If Mod($i, 2) = 0 Then
		 If $i = 0 Then
			$sum += $between+1;
		 Else
			$sum += $between;
			EndIf

		 If $sum >= 60 Then
			$hour =  Floor($sum / 3600)
			$min =  Floor(Mod($sum, 3600)/60)
			$sec =  Floor(Mod($sum, 60))
			If $min <= 9 Then
			   $min =  "0"&String($min)
			EndIf
			If $sec <= 9 Then
			   $sec =  "0"&String($sec)
			EndIf

			$all =  String($hour)&String($min)&String($sec)&"00"

		  click()
		  pixel()


		Else
		     $temp = $sum *100
		   ConsoleWrite($temp& @LF)
		     MouseClick("left",1819, 549,1,$speedDell)
		   Send($temp)
			MouseClick("left",1721, 543,1,2)

			pixel()

		EndIf

	   Else
		 $sum += $between
		If $sum >= 60 Then
			$hour =  Floor($sum / 3600)
			$min =  Floor(Mod($sum, 3600)/60)
			$sec =  Floor(Mod($sum, 60))
			If $min <= 9 Then
			   $min =  "0"&String($min)
			EndIf
			If $sec <= 9 Then
			   $sec =  "0"&String($sec)
			EndIf
			$all =  String($hour)&String($min)&String($sec)&"00"
			 click()

			pixel()
		Else
		   $temp = $sum *100
		   ConsoleWrite($temp& @LF)
		     MouseClick("left",1819, 549,1,$speedDell)
		   Send($temp)
		    MouseClick("left",1721, 543,1,2)
		 pixel()
		EndIf
	 EndIf

   Next
EndFunc

Func pixel()
   Sleep(200)
   $pos = PixelSearch(53, 601,1912, 633,0xEFEFEF)
   $x = $pos[0]
   $y = $pos[1]
   $checkX = $x+20
   $checkY = $y+50
    $health = PixelGetColor( $checkX ,  $checkY)
    If $health = 0x2A333A Then
	   wait()
   EndIf
   MouseClick("left",$x,$y+50,1,$speedDell)
   Sleep(300)
   Send("{DEL}")
EndFunc

Func click()
    $pos1 = PixelSearch(53, 601,1912, 633,0xEFEFEF)
   $x1 = $pos1[0]
   $y1 = $pos1[1]
   $checkX = $x1+20
   $checkY = $y1+50
    $health = PixelGetColor( $checkX ,  $checkY)
    If $health = 0x2A333A Then
	   wait()
   EndIf
   ConsoleWrite( $all& @LF)
   MouseClick("left",1819, 549,1,$speedDell)
   Send($all)
   MouseClick("left",1721, 543,1,$speedDell)
EndFunc




Func wait()
ConsoleWrite("debug : wait()"& @LF)
ConsoleWrite($a & @LF)

While 1
    Sleep(1000)
 WEnd
 EndFunc

Func stop()
   ConsoleWrite("Exit program&"& @LF)
    Exit
EndFunc