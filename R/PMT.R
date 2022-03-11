#' Title PMT
#'
#' PMT is a financial function that calculates the payment on a loan based on a fixed payment and a fixed interest rate.
#'
#' @param rate       Required. Lending rates.
#' @param nper       Required. The total number of payments for this loan.
#' @param pv         Required. Present value, or the sum of what a series of future payments are worth now, is also called principal.
#' @param fv         Optional. The future value, or the expected cash balance after the last payment. If fv is omitted, its value is assumed to be 0 (zero), i.e. the future value of the loan is 0.
#' @param type       Optional. The number 0 (zero) or 1 indicates the payout time.
#'
#' @return
#' @export
#'
#' @examples
#' PMT(0.36/12, 12*1, 1000)
PMT <- function(rate, nper,pv, fv=0, type=0){
  pmt = ifelse(rate!=0,
               (rate*(fv+pv*(1+ rate)^nper))/((1+rate*type)*(1-(1+ rate)^nper)),
               (-1*(fv+pv)/nper )
  )

  return(pmt)
}
