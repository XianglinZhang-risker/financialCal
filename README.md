# **`financialCal`**

根据Excel财务函数对PMT、IPMT、PPMT进行了封装，也支持irr函数和摊销表函数。

PMT, IPMT, PPMT are encapsulated according to Excel financial functions, and also supports irr function and amortization table function.

## 安装 Install

cran   : 暂未提交

github :
```R
devtools::install_github('https://github.com/XianglinZhang-risker/financialCal')
```

## 功能 feature

PMT：用于根据固定付款额和固定利率计算贷款的付款额。

IPMT：基于固定利率及等额分期付款方式，返回给定期数内对投资的利息偿还额。

PPMT：返回根据定期固定付款和固定利率而定的投资在已知期间内的本金偿付额。

irr：内部收益率计算。

amortisationschedule：摊销表计算。

## 例子 example

```
PMT(0.36/12, 12*1, 1000)
IPMT(0.36/12, 1, 12*1, 1000)
PPMT(0.36/12, 1, 12*1, 1000)
irr(c(1000,-353.5304,-353.5304,-353.5304))$IRR * 12
amortisationschedule(1000, 0.03, 3, 1)
```



