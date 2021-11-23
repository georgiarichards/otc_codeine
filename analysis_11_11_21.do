/* 
Name: Georgia Richards
Project: sales of OTC codeine products
Version Number: 4
Computer: Mac 
--------------------------------------------------------------------------
*/

* set directory & open data file 
cd "/Users/georgiarichards/Desktop/STATA/OTC"

* -------------------------------------------------------------------------- 
* descriptive analyses of products, formulations, pack sizes and doses
use "data_OTC_annual.dta"

* cleaning data 
* only interested in adult so removing as potentially used for children 
drop if Form=="HLC R SYS PAED SUP"
drop if Pack=="PAED SYRUP 100ML"
drop if Pack=="JUNIOR 100ML"
drop if Pack=="SYRUP CHLD 100ML"

*tabulating data 
tab Country, missing 
tab form3, missing 
tab Country form3, missing 
tab form3 Country, missing

groups form3
groups form3 Country

tab dose, missing
tab Country if dose!=., missing  
tab no_combinations, missing 
summarize no_combinations, detail

* Fig % of all OTC items sold by formulations 
graph bar (percent) count_total, graphregion(fcolor(white)) ylabel(, nogrid) ///
over(form3, sort(1) descending label(angle(45) labsize(2.2))) ///
ytitle("Percentage of products sold (%)" " ")
graph export percent_formulations.tif, width(1000) replace

save "data_OTC_annual.dta", replace 
clear

* --------------------------------------------------------------------------

* data by year 
use "data_OTC_31_15_11_21.dta"
 
save "data_OTC_31_15_11_21.dta", replace 

* data cleaning / wrangling - creating new variables - reported data 
egen total_cost = rowtotal(cost_2013 cost_2014 cost_2015 cost_2016 cost_2017 cost_2018)
generate mean_cost = total_cost/6
generate mean_cost_pop = (mean_cost/pop_2018)*1000
generate mean_cost_person = mean_cost/pop_2018

egen total_count = rowtotal(count_2013 count_2014 count_2015 count_2016 count_2017 count_2018)
generate mean_count = total_count/6 
generate mean_count_pop = (mean_count/pop_2018)*1000
generate mean_count_person = mean_count/pop_2018

generate countpop2013 = (count_2013/pop_2013)*1000
generate countpop2014 = (count_2014/pop_2014)*1000
generate countpop2015 = (count_2015/pop_2015)*1000
generate countpop2016 = (count_2016/pop_2016)*1000
generate countpop2017 = (count_2017/pop_2017)*1000
generate countpop2018 = (count_2018/pop_2018)*1000

generate coverage=.
summarize coverage, detail

generate coverage_dec = coverage/100
summarize coverage_dec, detail

* IQVIA coverage - adjusted data 
generate count_2013_adjust = count_2013/coverage_dec
generate count_2014_adjust = count_2014/coverage_dec
generate count_2015_adjust = count_2015/coverage_dec
generate count_2016_adjust = count_2016/coverage_dec
generate count_2017_adjust = count_2017/coverage_dec
generate count_2018_adjust = count_2018/coverage_dec

generate cost_2013_adjust = cost_2013/coverage_dec
generate cost_2014_adjust = cost_2014/coverage_dec
generate cost_2015_adjust = cost_2015/coverage_dec
generate cost_2016_adjust = cost_2016/coverage_dec
generate cost_2017_adjust = cost_2017/coverage_dec
generate cost_2018_adjust = cost_2018/coverage_dec

egen total_count_adjust = rowtotal(count_2013_adjust count_2014_adjust count_2015_adjust count_2016_adjust count_2017_adjust count_2018_adjust)
generate mean_count_adjust = total_count_adjust/6
generate mean_count_pop_adjust = (mean_count_adjust/pop_2018)*1000
generate mean_count_person_adjust = mean_count_adjust/pop_2018

egen total_cost_adjust = rowtotal(cost_2013_adjust cost_2014_adjust cost_2015_adjust cost_2016_adjust cost_2017_adjust cost_2018_adjust)
generate mean_cost_adjust = total_cost_adjust/6
generate mean_cost_pop_adjust = (mean_cost_adjust/pop_2018)*1000
generate mean_cost_person_adjust = mean_cost_adjust/pop_2018

generate countpop2013_adj = (count_2013_adjust/pop_2013)*1000
generate countpop2014_adj = (count_2014_adjust/pop_2014)*1000
generate countpop2015_adj = (count_2015_adjust/pop_2015)*1000
generate countpop2016_adj = (count_2016_adjust/pop_2016)*1000
generate countpop2017_adj = (count_2017_adjust/pop_2017)*1000
generate countpop2018_adj = (count_2018_adjust/pop_2018)*1000

generate costpop2013_adj = (cost_2013_adjust/pop_2013)*1000
generate costpop2014_adj = (cost_2014_adjust/pop_2014)*1000
generate costpop2015_adj = (cost_2015_adjust/pop_2015)*1000
generate costpop2016_adj = (cost_2016_adjust/pop_2016)*1000
generate costpop2017_adj = (cost_2017_adjust/pop_2017)*1000
generate costpop2018_adj = (cost_2018_adjust/pop_2018)*1000

save "data_OTC_31_15_11_21.dta", replace 

* total raw number of items sold over 6 years for all country 
total total_count
total total_count_adjust

* total expenditure/cost over 6 years for all country 
total total_cost
total total_cost_adjust

* percent change for all 31 countries
* rate of items in 2013
total count_2013
total pop_2013
display (4.78e+09/1.58e+09)*1000

total count_2013_adjust
display (6.18e+09/1.58e+09)*1000

* rate of items in 2018
total count_2018
total pop_2018
display (5.04e+09/1.62e+09)*1000

total count_2018_adjust
display (7.06e+09/1.62e+09)*1000

* % change for items - reported 
display ((3111.1111-3025.3165)/3025.3165)*100
* % change for items - adjusted
display ((4358.0247-3911.3924)/3911.3924)*100

* rate for cost in 2013
total cost_2013
total pop_2013
display (3.10e+08/1.58e+09)*1000

total cost_2013_adjust
display (4.15e+08/1.58e+09)*1000

* rate for cost in 2018
total cost_2018
total pop_2018
display (4.88e+08/1.62e+09)*1000

total cost_2018_adjust
display (7.31e+08/1.62e+09)*1000
* % change for expenditure - adjusted 
display ((451.23457-262.65823)/262.65823)*100

* REPORTED
* distribution of sales - ranking of countries by % of sales 
generate percent_country_count=(total_count/31535403840)*100
generate percent_country_cost=(total_cost/2546918149)*100

*spread of data
gsort -percent_country_count
list Country percent_country_count total_count

display 34.25558+20.04622+16.55324+14.55396+5.005107
*Adjusted calculations not done above 

* mean items sold per person over 6 years, ranked by country - reported 
gsort -mean_count_person
list Country mean_count_person

gsort -mean_count_pop
list Country mean_count_pop

graph bar mean_count_pop, graphregion(fcolor(white)) ylabel(, nogrid) ///
over(Country, sort(1) descending label(angle(45) labsize(2.2))) ///
ytitle("Mean dosage units reported per 1000 population" " ")
graph export total_mean_items.tif, width(1000) replace 

* mean items sold per person over 6 years, ranked by country - adjusted
gsort -mean_count_person_adjust
list Country mean_count_person_adjust

graph bar mean_count_pop_adjust, graphregion(fcolor(white)) ylabel(, nogrid) ///
over(Country, sort(1) descending label(angle(45) labsize(2.2))) ///
ytitle("Adjusted mean dosage units per 1000 population" " ")
graph export total_mean_items_adj.tif, width(1000) replace 

* adjusted sales - Table 1
egen count_sd_adj=rowsd(countpop2013_adj countpop2014_adj countpop2015_adj countpop2016_adj countpop2017_adj countpop2018_adj)
egen cost_sd_adj=rowsd(costpop2013_adj costpop2014_adj costpop2015_adj costpop2016_adj costpop2017_adj costpop2018_adj)

gsort Country
list Country mean_count_pop_adjust
list Country count_sd_adj cost_sd_adj
list Country coverage mean_count_pop mean_count_pop_adjust

*  SD for reported data - Table 1 
egen count_sd=rowsd(countpop2013 countpop2014 countpop2015 countpop2016 countpop2017 countpop2018)
egen cost_sd=rowsd(costpop2013 costpop2014 costpop2015 costpop2016 costpop2017 costpop2018)

* mean expenditure per person for each country over 6 years - reported 
gsort -mean_cost_person
list Country mean_cost_person

gsort -mean_cost_pop
list Country mean_cost_pop

graph bar mean_cost_pop, graphregion(fcolor(white)) ylabel(, nogrid) ///
over(Country, sort(1) descending label(angle(45) labsize(2.2))) ///
ytitle("Reported mean expenditure" "(£, GBP) per 1000 population" " ")
graph export total_mean_expenditure.tif, width(1000) replace 

* mean expenditure per person for each country over 6 years - adjusted 
gsort -mean_cost_person_adjust
list Country mean_cost_person_adjust

gsort -mean_cost_pop_adjust
list Country mean_cost_pop_adjust

graph bar mean_cost_pop_adjust, graphregion(fcolor(white)) ylabel(, nogrid) ///
over(Country, sort(1) descending label(angle(45) labsize(2.2))) ///
ytitle("Adjusted mean expenditure" "(£, GBP) per 1000 population" " ")
graph export total_mean_expenditure_adj.tif, width(1000) replace 

* adjusted expenditure - table 1
gsort Country
list Country mean_cost_pop_adjust

* percentage change over time for total sales per 1000 pop - reported 
generate percent_count = ((countpop2018-countpop2013)/countpop2013)*100
gsort -percent_count
list Country percent_count countpop2013 countpop2018

* percentage change over time for total sales per 1000 pop - adjusted 
generate percent_count_adj = ((countpop2018_adj-countpop2013_adj)/countpop2013_adj)*100

* impact of changes in France 
list percent_count countpop2013 countpop2018 if Country=="France"
generate percent_count_Fr_17 = ((countpop2017-countpop2016)/countpop2016)*100
generate percent_count_Fr_18 = ((countpop2018-countpop2017)/countpop2017)*100
list percent_count_Fr_17 countpop2016 countpop2017 if Country=="France"
list percent_count_Fr_18 countpop2017 countpop2018 if Country=="France"

* percentage change over time for total cost per 1000 pop - reported 
generate percent_cost = ((costpop2018-costpop2013)/costpop2013)*100
gsort -percent_cost
list Country percent_cost costpop2013 costpop2018
list Country percent_count percent_cost

* percentage change over time for total cost per 1000 pop - adjusted  
generate percent_cost_adj = ((costpop2018_adj-costpop2013_adj)/costpop2013_adj)*100

* histogram of % changes - reported 
graph bar percent_count percent_cost if percent_change==1, ///
over(Country, sort(1) descending label(angle(45) labsize(2.2))) ///
ytitle("% increase") ylabel(0(1000)2000, nogrid) ///
graphregion(fcolor(white)) ///
legend(label(1 "sales volume") label(2 "expenditure, £") cols(1) position(2) ring(0)) ///
saving(increase3) 

graph bar percent_count percent_cost if percent_change==2, ///
over(Country, sort(1) descending label(angle(45) labsize(2.2))) ///
ytitle("% decrease") ylabel(0(-50)-100, nogrid) ///
graphregion(fcolor(white)) legend(off) ///
saving(decrease2)

graph bar percent_count percent_cost if percent_change==3, ///
over(Country, sort(1) descending label(angle(45) labsize(2.2))) ///
ytitle("% change") ylabel(-100(450)800, nogrid) ///
graphregion(fcolor(white)) legend(off) ///
saving(mixed2)

gr combine increase3.gph decrease2.gph mixed2.gph, col(2) graphregion(fcolor(white))
graph export percent_change_combined.tif, width(1000) replace 

* histogram of % changes - adjusted 
graph bar percent_count_adj percent_cost_adj if percent_change==1, ///
over(Country, sort(1) descending label(angle(45) labsize(2.2))) ///
ytitle("% increase") ylabel(0(1000)2000, nogrid) ///
graphregion(fcolor(white)) ///
legend(label(1 "sales") label(2 "expenditure, £") cols(1) position(2) ring(0)) ///
saving(increase3adj) 

graph bar percent_count_adj percent_cost_adj if percent_change==2, ///
over(Country, sort(1) descending label(angle(45) labsize(2.2))) ///
ytitle("% decrease") ylabel(0(-50)-100, nogrid) ///
graphregion(fcolor(white)) legend(off) ///
saving(decrease2adj)

graph bar percent_count_adj percent_cost_adj if percent_change==3, ///
over(Country, sort(1) descending label(angle(45) labsize(2.2))) ///
ytitle("% change") ylabel(-100(450)800, nogrid) ///
graphregion(fcolor(white)) legend(off) ///
saving(mixed2adj)

gr combine increase3adj.gph decrease2adj.gph mixed2adj.gph, col(2) graphregion(fcolor(white))
graph export percent_change_combined_adj.tif, width(1000) replace 

save "data_OTC_31_15_11_21.dta", replace 

clear

* --------------------------------------------------------------------------
* preparing data for python graphs 
use "data_OTC_python.dta"

save "data_OTC_python.dta", replace 
  
rename countpop2014_adj countpopadj2014
rename countpop2015_adj countpopadj2015
rename countpop2016_adj countpopadj2016
rename countpop2017_adj countpopadj2017
rename countpop2018_adj countpopadj2018

rename costpop2013_adj costpopadj2013
rename costpop2014_adj costpopadj2014
rename costpop2015_adj costpopadj2015
rename costpop2016_adj costpopadj2016
rename costpop2017_adj costpopadj2017
rename costpop2018_adj costpopadj2018

generate order1=.
generate order2=.
generate country2=Country

reshape long countpop costpop countpopadj costpopadj, i(Country) j(year)

outsheet Country year order1 order2 countpop costpop countpopadj costpopadj country2 using data_otc_long.csv , comma replace

type data_otc_long.csv

save "data_OTC_python.dta", replace 

* --------------------------------------------------------------------------


