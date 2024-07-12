@echo off
setlocal enabledelayedexpansion

:menu
cls
echo Select a shape:
echo 1. Circle
echo 2. Triangle
echo 3. Quadrilateral
echo 4. Exit
set /p shape=Enter your choice (1-4): 

if "%shape%"=="1" goto circle
if "%shape%"=="2" goto triangle
if "%shape%"=="3" goto quadrilateral
if "%shape%"=="4" goto end
goto menu

:circle
set /p radius=Enter the radius of the circle: 
set /a area=314*radius*radius/100
echo The area of the circle is: %area%
pause
goto menu

:triangle
set /p a=Enter the length of side a: 
set /p b=Enter the length of side b: 
set /p c=Enter the length of side c: 

:: Calculate the semi-perimeter
set /a s=(a+b+c)/2

:: Calculate the area using Heron's formula
set /a area=s*(s-a)*(s-b)*(s-c)
set /a area_sqrt=0
for /L %%i in (1,1,%area%) do (
    set /a area_sqrt+=1
    set /a temp=area_sqrt*area_sqrt
    if !temp! geq %area% (
        if !temp! equ %area% goto calc_done
        set /a area_sqrt-=1
        goto calc_done
    )
)
:calc_done
echo The area of the triangle is: %area_sqrt%

:: Determine the type of triangle
if %a%==%b% if %b%==%c% (
    echo The triangle is equilateral.
) else if %a%==%b% if not %b%==%c% (
    echo The triangle is isosceles.
) else if %a%==%c% if not %b%==%c% (
    echo The triangle is isosceles.
) else if %b%==%c% if not %a%==%c% (
    echo The triangle is isosceles.
) else (
    echo The triangle is scalene.
)

pause
goto menu

:quadrilateral
set /p length=Enter the length: 
set /p width=Enter the width: 
set /a area=length*width
echo The area of the quadrilateral is: %area%

if %length%==%width% (
    echo The quadrilateral is a square.
) else (
    echo The quadrilateral is a rectangle.
)

pause
goto menu

:end
echo Exiting the script.
pause
