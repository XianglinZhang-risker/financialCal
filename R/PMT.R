#' Title PMT
#'
#' Instalment of Loan
#'
#' @param rate
#' @param nper
#' @param pv
#' @param fv
#' @param type
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
