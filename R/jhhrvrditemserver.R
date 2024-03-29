

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
#' @examples viewrditemserver()  
viewrditemserver <- function(input,output,session,dms_token) {

  
  shiny::observe({
    shiny::observeEvent(input$btn_hrv_ods_view_rditem,
                        {
                            sql = 'select * from rds_hrv_ods_md_rditem'
                            
                            data = tsda::sql_select2(token = dms_token, sql = sql)
                            
                            names(data) = c('组织',
                                            'RD-项目（人工费用表格）',
                                            '系统项目名称'
                            )
                            #显示数据
                            tsui::run_dataTable2(id = 'hrv_ods_view_data_rditem', data = data)
                            
                            
                 
                          
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
jhhrvrditemServer <- function(input,output,session,dms_token) {
  #预览数据
  viewrditemserver(input,output,session,dms_token)

}
