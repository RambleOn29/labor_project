version 12.0
set more off
clear all
set matsize 11000

// describe your projects
/*
Project :       Your Projects
Description:    this .do file is the main driver for the estimations
*This version:  September 15, 2015
*This .do file: Econ 344 Student 
*This project : Econ 344 
*/

// declare your global variables
// seed 
set seed 1  // so if you generate random variables they
            // take the same values everytime you run the code
// set environment variables
global projects:    env  projects   // folder  with your projects
global klmshare:    env  klmshare   // common  data storage 
global klmmexico:   env  klmMexico  // private data storage 

// set general locations
// do files
global scripts =  "$projects/Moffitt/Scripts/"  // dofiles
// ready data
global data    =  "$klmmexico/MoffittData/"     // data 
// output
global output  =  "$projects/Moffitt/Output/"   // output 


// simulate some data
clear all
// generate data
set obs 10
gen id = _n  

// weights
gen w = rnormal(100,10)
replace w = w/100

// y, outcome
foreach num of numlist 1(1)3 {
	gen y`num' = floor(rnormal(20,5))
}

// x,y labels
global y1label y1
global y2label y2
global y3label y3*/

// make a nice plot
# delimit
twoway (histogram y1, discrete fraction color(gs10)  barwidth(.75))
	   (histogram y2, discrete fraction fcolor(none) barwidth(.75) lcolor(black)),
	   legend(label(1 Gray) label(2 White))
	   xtitle(Y) ytitle(Fractiion)
	   xlabel(, grid glcolor(gs14)) ylabel(, angle(h) glcolor(gs14))
	   graphregion(color(white)) plotregion(fcolor(white));
#delimit cr

cd $output
graph export histogram.eps, replace
