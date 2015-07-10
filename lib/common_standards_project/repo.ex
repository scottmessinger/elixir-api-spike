defmodule CommonStandardsProject.Repo do
  use Ecto.Repo, otp_app: :common_standards_project, adapter: Mongo.Ecto
end
