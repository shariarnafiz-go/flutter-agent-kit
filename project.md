# project.md — Fill this before running setup.ps1

## Identity
name: "Budget Bite"           # e.g. Budget Bite
package: "budget_bite"         # e.g. my_btc_canvas
description: "Budget Bite is a specialized mess management application designed to eliminate the manual complexity of communal living. It serves as a digital ledger that automates the "meal rate" system commonly used in shared housing (messes) in cities like Dhaka."     # One-line description
repo_url: "https://github.com/shariarunix/budget_bite"

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
