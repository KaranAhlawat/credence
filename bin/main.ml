let () =
  Dream.run
  @@ Dream.logger
  @@ Dream.cookie_sessions
  @@ Dream.router
       [ Dream.post
           "/login"
           (Auth.MW.authenticate
              { success_redirect = Some "/login-success"
              ; failure_redirect = "/login-fail"
              ; failure_flash_message = false
              }
              Handlers.handle_post_login)
       ; Dream.get "/login-success" (Auth.MW.protected Handlers.handle_get_login_succ)
       ; Dream.get "/login-fail" (fun _ -> Dream.html "Please login")
       ]
;;
