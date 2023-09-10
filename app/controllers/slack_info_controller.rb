class SlackInfoController < ApplicationController
  def info
    slack_name = params[:slack_name] || 'damaris'
    current_day = Time.now.strftime('%A')
    utc_time = Time.now.utc
    track = params[:track] || 'frontend'

    # Construct GitHub URLs (replace with your actual URLs)
    github_file_url = 'https://github.com/ndush/slack_info_api/blob/main/file_name.ext'
    github_repo_url = 'https://github.com/ndush/slack_info_api'

    # Validate UTC time within +/-2 minutes
    time_diff = (utc_time - Time.now).to_i
    is_valid_utc_time = time_diff.abs <= 120  # 2 minutes = 120 seconds

    if is_valid_utc_time
      utc_time_str = utc_time.strftime('%Y-%m-%dT%H:%M:%SZ')
    else
      utc_time_str = 'Invalid UTC Time'
    end

    response_data = {
      slack_name: slack_name,
      current_day: current_day,
      utc_time: utc_time_str,
      track: track,
      github_file_url: github_file_url,
      github_repo_url: github_repo_url,
      status_code: 200
    }

    render json: response_data
  end
end