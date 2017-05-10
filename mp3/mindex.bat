rem v1.6
rem by littleflute 2017.4.10 12:56pm usa
del index.html



@echo off
echo ^<!DOCTYPE html^>	>>index.html  
echo ^<html^> >>index.html 
echo ^<body^> >>index.html
echo %1 >>index.html
echo ^<br^> >>index.html
echo ^<div id="DivCurTime"^>^</div^> >>index.html
echo ^<br^> >>index.html
echo ^<button onclick="getCurTime()" type="button"^>Get current time position^</button^> >>index.html 

echo ^<button onclick="setCurTime(0)" type="button"^>00^</button^>^<br^> >>index.html  

echo ^<button onclick="moveMS(-0.05)" type="button"^>Time-50ms^</button^>  >>index.html
echo ^<button onclick="moveMS(-0.01)" type="button"^>-10ms^</button^>  >>index.html
echo ^<button onclick="moveMS(0.01)" type="button"^>+10ms^</button^>  >>index.html
echo ^<button onclick="moveMS(0.05)" type="button"^>+50ms^</button^>  >>index.html
echo ^<button onclick="setCurTime(5)" type="button"^>Set time position to 5 seconds^</button^>^<br^>   >>index.html

@echo on
setlocal ENABLEDELAYEDEXPANSION
call set /a x = -1
for /F %%n in ('dir /b *.mp3') do ( 
	if !x! == 10 (
		echo ^<br^> >>index.html
	)
	if !x! == 20 (
		echo ^<br^> >>index.html
	)
	if !x! == 30 (
		echo ^<br^> >>index.html
	)
	if !x! == 40 (
		echo ^<br^> >>index.html
	)
	call set /a x = !x! + 1
	echo ^<button onclick="play('%%n')"^>%%n^</button^> >>index.html
)


@echo off  
echo ^<br^> >>index.html
echo ^<audio id="myPlayer" width="720" height="480" controls^> >>index.html
echo  ^<source src="0.mp3" type="video/mp4"^>  >>index.html
echo Your browser does not support HTML5 audio. >>index.html
echo ^</audio^>  >>index.html
echo ^<script^>  >>index.html
echo var vid = document.getElementById("myPlayer"); >>index.html

echo function play(fileName) {>>index.html
    
echo     myPlayer.src=fileName; >>index.html
echo     myPlayer.load();>>index.html
echo     myPlayer.play(); >>index.html
echo }>>index.html
 

echo function getCurTime() {  >>index.html
echo    document.getElementById("DivCurTime").innerHTML= vid.currentTime; >>index.html
echo }   >>index.html
echo function setCurTime(t) {>>index.html 
echo    vid.currentTime=t;  >>index.html
echo    getCurTime();>>index.html
echo }  >>index.html
echo function moveMS(ms) {>>index.html 
echo   vid.currentTime+=ms;>>index.html
echo   getCurTime();  >>index.html
echo }   >>index.html
echo ^</script^> >>index.html
echo ^</body^> >>index.html
