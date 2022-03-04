#' Title IPMT
#'
#' Interest portion of instalment in each period
#'
#' @param rate
#' @param per
#' @param nper
#' @param pv
#' @param fv
#' @param type
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
