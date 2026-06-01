# project.md — Fill this before running setup.ps1

## Identity
name: "FEDA App"           # e.g. My App
package: "feda_app"         # e.g. my_app
description: "A high-performance Flutter application built on Feature-First Event-Driven Clean Architecture."     # One-line description
repo_url: "https://github.com/username/feda_app"

## SDK
flutter_version: "3.41.7"   # e.g. 3.38.5
dart_version: "3.11.5"         # e.g. ^3.9.0

## Stack (true/false)
riverpod: true
go_router: true
freezed: true
firebase: true
supabase: true

## APIs [No Dedicated Backend]
core_api_base: "[CORE_API_BASE_URL]"
core_api_version: "/v1"
secondary_api_base: ""           # Leave blank if none

## Caching (optional)
cache_enabled: true
cache_default_store: hybrid         # memory | hive | hybrid
cache_default_ttl_minutes: 5
cache_live_refresh_interval_seconds: 0  # 0=event-driven only, >0=periodic

## Team
team_size: "1"
