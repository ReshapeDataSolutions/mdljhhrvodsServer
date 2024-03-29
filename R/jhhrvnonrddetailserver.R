

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
#' @examples viewsalaryserver()  
viewnonrddetailserver <- function(input,output,session,dms_token) {

  
  shiny::observe({
    shiny::observeEvent(input$btn_hrv_ods_view_nonrddetail,
                        {
                            sql = 'select * from rds_hrv_ods_ds_nonrddetail'
                            
                            data = tsda::sql_select2(token = dms_token, sql = sql)
                            
                            names(data) = c('序号',
                                            '工资类别',
                                            '会计年度',
                                            '会计期间',
                                            '原部门',
                                            '高新部门',
                                            '姓名',
                                            '费用承担组织',
                                            '个税申报组织',
                                            '单据编号',
                                            '非研发工资成本',
                                            '项目名称'
                            )
                            #显示数据
                            tsui::run_dataTable2(id = 'hrv_ods_view_data_nonrddetail', data = data)
                            
                            
                 
                          
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
jhhrvnonrddetailServer <- function(input,output,session,dms_token) {
  #预览数据
  viewnonrddetailserver(input,output,session,dms_token)

}
