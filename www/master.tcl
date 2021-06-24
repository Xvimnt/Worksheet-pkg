ad_page_contract {
    This page will get the plugins and the UI for the project.
} { }
set page_title "Worksheet"
set user_id [ad_conn user_id]
set package_id [ad_conn package_id]
set project_name "worksheetproject"

# Navbar Parameters
# 
set main_url "/$project_name"
set salary_url "$main_url/salary"
set iggs_url "$main_url/iggs"
set employee_url "$main_url/employee"
set worksheet_url "$main_url/worksheets"