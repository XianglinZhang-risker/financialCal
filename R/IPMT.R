#' Title IPMT
#'
#' Returns the amount of interest repayment on an investment for a given number of periods, based on a fixed interest rate and equal installments.
#'
#' @param rate        Required. Lending rates.
#' @param per         Required. The number of periods used to calculate its interest amount, must be between 1 and nper.
#' @param nper        Required. The total number of payments for this loan.
#' @param pv          Required. Present value, or the sum of what a series of future payments are worth now, is also called principal.
#' @param fv          Optional. The future value, or the expected cash balance after the last payment. If fv is omitted, its value is assumed to be 0 (zero), i.e. the future value of the loan is 0.
#' @param type        Optional. The number 0 (zero) or 1 indicates the payout time.
#'
#' @return
#' @export
#'
#' @examples
#' IPMT(0.36/12, 1, 12*1, 1000)
IPMT <- function(rate, per, nper, pv, fv=0, type=0){
  ipmt = -( ((1+rate)^(per-1)) * (pv*rate + PMT(rate, nper,pv, fv=0, type=0)) - PMT(rate, nper,pv, fv=0, type=0))
  return(ipmt)
}
