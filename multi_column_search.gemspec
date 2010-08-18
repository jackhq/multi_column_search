# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{multi_column_search}
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jack Russell Software"]
  s.date = %q{2010-08-18}
  s.description = %q{Quick and dirty multi column LIKE searches.}
  s.email = %q{team@jackrussellsoftware.com}
  s.extra_rdoc_files = ["CHANGELOG", "README.rdoc", "lib/multi_column_search.rb"]
  s.files = ["CHANGELOG", "Manifest", "README.rdoc", "Rakefile", "init.rb", "lib/multi_column_search.rb", "multi_column_search.gemspec", "spec/models.rb", "spec/multi_column_search_spec.rb", "spec/spec_helper.rb"]
  s.homepage = %q{http://github.com/jackhq/multi_column_search}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Multi_column_search", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{multi_column_search}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Quick and dirty multi column LIKE searches.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
