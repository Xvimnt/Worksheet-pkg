ad_page_contract {
    This page will display the menu of the current package.
} {
    orderby:optional
}
set page_title "Worksheet"
set user_id [ad_conn user_id]
set package_id [ad_conn package_id]

# Salary Card Parameters
# 
set salary_title "Salario Ordinario"
set salary_url "salary"