variable "RUN_NUMBER" {
  default = "1"
}

group "default" {
  targets = ["quick-image", "heavy-image"]
}

target "quick-image" {
  context = "__tests__"
  dockerfile = "./Dockerfile"
  tags = ["quick-image-run-${RUN_NUMBER}"]
  platforms = ["linux/amd64"]
  output = ["type=docker"]
  profiles = ["dev-eph"]
  args = {
    BUILD_TYPE = "quick"
  }
}

target "heavy-image" {
  context = "__tests__"
  dockerfile = "./Dockerfile"
  tags = ["heavy-image-run-${RUN_NUMBER}"]
  platforms = ["linux/amd64"]
  output = ["type=docker"]
  profiles = ["dev-eph"]
  args = {
    BUILD_TYPE = "heavy"
  }
  # Add more build steps or dependencies to make it take longer
  contexts = {
    quick-image = "target:quick-image"
  }
} 