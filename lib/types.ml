type 'a authed_request =
  { request : Dream.request
  ; user : 'a
  }

type 'a auth_handler = 'a authed_request -> Dream.response Lwt.t
