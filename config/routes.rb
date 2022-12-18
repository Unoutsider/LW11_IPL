Rails.application.routes.draw do
  root 'calc#input'
  get 'calc/output'
  get 'calc/db_input'
  get 'calc/db_output'
  get 'calc/check_data_xml'
end
