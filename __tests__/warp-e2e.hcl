target "default" {
  context    = "__tests__"
  dockerfile = "./warp-e2e.Dockerfile"
  output     = ["type=cacheonly"]
}
