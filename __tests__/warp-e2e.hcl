variable "MARKER" {
  default = "unset"
}

target "default" {
  context    = "__tests__"
  dockerfile = "./warp-e2e.Dockerfile"
  output     = ["type=docker"]
  args = {
    MARKER = MARKER
  }
  labels = {
    "com.warpbuild.e2e" = "true"
  }
}
