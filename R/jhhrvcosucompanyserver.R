

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
#' @examples viewcosucompanyserver()  
viewcosucompanyserver <- function(input,output,session,dms_token) {

  
  shiny::observe({
    shiny::observeEvent(input$btn_hrv_ods_view_cosucompany,
                        {
                            sql = 'select * from rds_hrv_ods_md_cosucompany'
                            
                            data = tsda::sql_select2(token = dms_token, sql = sql)
                            names(data) = c('项目',
                                            '编码',
                                            '名称') 
                            #显示数据
                            tsui::run_dataTable2(id = 'hrv_ods_view_data_cosucompany', data = data)
                            
                            
                 
                          
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
jhhrvcosucompanyServer <- function(input,output,session,dms_token) {
  #预览数据
  viewcosucompanyserver(input,output,session,dms_token)

}
