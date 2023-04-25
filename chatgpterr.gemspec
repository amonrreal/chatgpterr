require_relative 'lib/chatgpterr/version'

Gem::Specification.new do |spec|
  spec.name          = 'chatgpterr'
  spec.version       = ChatgptErr::VERSION
  spec.authors       = ['Alvaro Monrreal']
  spec.email         = ['alvaro.monrreal@gmail.com']

  spec.summary       = 'ChatgptErr is a Ruby wrapper for the OpenAI API. It provides an explanation of errors on Ruby on Rails projects using ChatGPT.'
  spec.description   = 'ChatgptErr is a Ruby wrapper for the OpenAI API. It provides an explanation of errors on Ruby on Rails projects using ChatGPT.'
  spec.homepage      = 'https://github.com/amonrreal/chatgpterr'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end
