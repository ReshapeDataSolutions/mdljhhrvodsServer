

#' Title 预览数据
#'
#' @param input 输入
#' @param output 输出
#' @param session 会话
#' @param dms_token 口令
#'
#' @return 返回值
#' @export
#'
#' @examples viewpreCheckserver()  
viewpreCheckserver <- function(input,output,session,dms_token) {

  
  shiny::observe({
    shiny::observeEvent(input$btn_hrv_ods_view_preCheck,
                        {
                            sql = 'select * from rds_hrv_ods_rule_preCheck'
                            
                            data = tsda::sql_select2(token = dms_token, sql = sql)
                            names(data) = c(
                              '业务类型',
                              '银行',
                              '费用承担组织',
                              '个税申报组织'
                              
                            )
                            #显示数据
                            tsui::run_dataTable2(id = 'hrv_ods_view_data_preCheck', data = data)
                            
                            
                 
                          
                        })
    
  })
}



#' Title 后台处理总函数
#'
#' @param input 输入
#' @param output 输出
#' @param session 会话
#' @param dms_token 口令
#'
#' @return 返回值
#' @export
#'
#' @examples HrvServer()
jhhrvpreCheckServer <- function(input,output,session,dms_token) {
  #预览数据
  viewpreCheckserver(input,output,session,dms_token)

}
