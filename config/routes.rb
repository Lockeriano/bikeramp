# frozen_string_literal: true

Rails.application.routes.draw do
  mount API::App => '/api'
  mount GrapeSwaggerRails::Engine => '/swagger'
end
