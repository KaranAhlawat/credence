module LocalStrategy = Passeport.Strategy.Local.Make (Config)
module MW = Passeport.Middleware.Authenticate.Make (LocalStrategy)
