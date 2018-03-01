json.id @task.id
json.title @task.title
json.body @task.body
json.creator @task.creator
json.creator_id @task.creator_id
json.assignee @task.assignee
json.assignee_id @task.assignee_id

json.feedbacks @task.feedbacks do |feedback|
  json.id feedback.id
  json.comment feedback.comment
  json.creator feedback.creator
  json.creator_id feedback.creator_id
end
