#' Title amortisationschedule
#'
#' amortisationschedule
#'
#' @param amount               principal
#' @param monthlyinterestrate  monthly interest rate
#' @param paymentsperyear      period
#' @param years                years
#'
#' @return                     A list with repayment schedule and basic loan information.
#' @export
#' @import tidyverse
#'
#' @examples
#' df <- amortisationschedule(1000, 0.03, 3, 1)
#'
#' df
#'
amortisationschedule <- function(amount, monthlyinterestrate, paymentsperyear, years) {

  annualinterestrate <- monthlyinterestrate * 12

  nper = paymentsperyear * years
  rate = monthlyinterestrate

  AmortisationSchedule <- data.frame(
    Principal = map_dbl(1:nper, function(x)
      PPMT(rate,
           x,
           nper,
           amount)),

    Interest = map_dbl(1:nper, function(x)
      IPMT(rate,
           x,
           nper,
           amount))
  ) %>% mutate(Instalment = Principal + Interest,
               Balance = round(amount + cumsum(Principal),2))

  InfoData <- data.frame(
    detail = c(
      amount
      , -sum(AmortisationSchedule$Instalment)
      , -sum(AmortisationSchedule$Interest)
      , annualinterestrate
      , round(
        (
          -sum(AmortisationSchedule$Interest) / amount
        )
        , 6
      ) * ((12/paymentsperyear/years))
      , monthlyinterestrate
      , round(
        (
          -sum(AmortisationSchedule$Interest) / amount
        ) * ((12/paymentsperyear/years)) / 12
        , 6)
      , monthlyinterestrate * paymentsperyear
      , round(
        (
          -sum(AmortisationSchedule$Interest) / amount
        ) * ((12/paymentsperyear/years)) / 12 * paymentsperyear
        , 6)
    )
    , row.names = c(
      "Loan"
      , "Total Paid"
      , "Total Interest"
      , "IRR Rate Y"
      , "APR Rate Y"
      , "IRR Rate M"
      , "APR Rate M"
      , "IRR Rate G"
      , "APR Rate G"
    )
  )

  return(
    list(
      repayPlan = AmortisationSchedule
      , info = InfoData
    )
  )

}
