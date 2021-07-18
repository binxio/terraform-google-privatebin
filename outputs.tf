output "url" {
  description = "url of the privatebin service"
  value       = google_cloud_run_service.privatebin.status[0].url
}
