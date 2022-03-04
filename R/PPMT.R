#' Title PPMT
#'
#' Principal portion of instalment in each period
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
#' PPMT(0.36/12, 1, 12*1, 1000)
PPMT <- function(rate, per, nper, pv, fv=0, type=0){
  ppmt = PMT(rate, nper,pv, fv=0, type=0) - IPMT(rate, per, nper, pv, fv=0, type=0)
  return(ppmt)
}
