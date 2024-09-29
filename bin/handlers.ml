let handle_post_login (req : Config.User.t Credence.authed_request) = Dream.html req.user.name
let handle_get_login_succ (req : Config.User.t Credence.authed_request) = Dream.html req.user.name
