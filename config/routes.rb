Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"

  get "/login",to:"sessions#login"
  post "/login",to:"sessions#login"

  get "/logout",to:"sessions#logout"

  get "register", to:"users#register"
  post "register", to:"users#register"

  get "/createdailyexp",to:"dailyexps#createdailyexp"
  post "/createdailyexp",to:"dailyexps#createdailyexp"

  get "/createdailyexpfadv",to:"dailyexps#createdailyexpfadv"
  post "/createdailyexpfadv",to:"dailyexps#createdailyexpfadv"

  get "/createadvance",to:"advances#createadvance"
  post "/createadvance",to:"advances#createadvance"

  #reports
  get "/advancereports",to:"advances#advancereports"
  get "/expensereports",to:"dailyexps#expensereports"
  get "/monthlyauditreports",to:"monthlyaudits#monthlyauditreports"

  #audit
  get "/makeaudit",to:"monthlyaudits#makeaudit"

  #changepassword
  get "/changepassword",to:"users#changepassword"
  post "/changepassword",to:"users#changepassword"

  #savemoney
  get "/savemoney",to:"savemoneys#savemoney"
  post "/savemoney",to:"savemoneys#savemoney"

  get "/mysavingaccount",to:"savemoneys#mysavingaccount"
  post "/mysavingaccount",to:"savemoneys#mysavingaccount"

  get "/assignshare/:id",to:"savemoneys#assignshare"
  post "/assignshare/:id",to:"savemoneys#assignshare"

  get "/removesharing/:id",to:"savemoneys#removesharing"

  get "/familysharingaccounts",to:"savemoneys#familysharingaccounts"
  
end
