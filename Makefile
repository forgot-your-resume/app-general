package := beautyverse
file := test/coverage_helper_test.dart

release: build_release_android build_release_ios

format_code:
	@echo "\033[32m Formatting code... \033[0m"
	@fvm dart format --line-length 120 lib test
	
unit_tests:
	@fvm flutter test --dart-define=IS_CI=true --coverage --coverage-path=coverage/lcov.info || true

# Creates new page using class mason templates
new_page:
	mason get; mason make page --root_folder_path $(shell pwd);

# Creates new use_case class using mason templates
new_use_case:
	 mason get; mason make use_case --root_folder_path $(shell pwd);

# Creates new repository class using mason templates
new_repository:
	mason get; mason make repository --root_folder_path $(shell pwd);

new_ui:
	mason get; mason make uikit --root_folder_path $(shell pwd);

build_release_ios:
	@fvm flutter build ipa

build_release_android:
	@fvm flutter build appbundle

widgetbook:
	@fvm flutter build web -t lib/widgetbook/main.dart --profile

update_golden:
	@fvm flutter test --update-goldens
	

# # Moves and/or renames repository class using mason templates
# move_repository:
# 	@pushd tools/templates; mason get; mason make move_repository --root_folder_path $(shell pwd); popd

# # Moves and/or renames page class using mason templates
# move_page:
# 	@pushd tools/templates; mason get; mason make move_page --root_folder_path $(shell pwd); popd