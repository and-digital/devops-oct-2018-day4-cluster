

resource "aws_ecs_task_definition" "vote" {
  container_definitions = <<-EOF
  [
    {
      "name": "VOTE",
      "image": "122275815213.dkr.ecr.eu-west-2.amazonaws.com/vote:latest",
      "cpu": 10,
      "environment": [{
        "name": "DB_HOST",
        "value": "KEY"
      },{
        "name": "DB_PORT",
        "value": "KEY"
      }],
      "memory": 256,
      "essential": true,
      "portMappings": [
        {
          "containerPort": 80,
          "hostPort": 0
        }
      ]
    }
  ]
  EOF
  family = "vote"
}
