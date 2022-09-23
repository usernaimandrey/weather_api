# frozen_string_literal: true

namespace :git do
  desc 'TODO'
  task :push, %i[commit_name skip_ci] => :environment do |_t, args|
    print "#{'#' * 5} Task Run! #{'#' * 5}\n"

    abort 'Error! Name commit not passed!' if args[:commit_name].blank?

    commit_name = args[:skip_ci].present? ? "#{args[:commit_name]}[skip ci]" : args[:commit_name]
    sh 'git add .'
    sh "git commit -m #{commit_name}"
    sh 'git push'

    print "#{'#' * 5} Task Done! #{'#' * 5}\n"
  end
end
