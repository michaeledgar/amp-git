class Amp::Plugins::Git < Amp::Plugins::Base
  def initialize(opts)
    @opts = opts
  end
  
  def load!
    puts "Loading amp-git..."
    require 'amp-git/repository'
    Amp.class_eval do
      git = Module.new do
        autoload :Changeset,                 "amp-git/repository/git/repo_format/changeset.rb"
        autoload :WorkingDirectoryChangeset, "amp-git/repository/git/repo_format/changeset.rb"
        autoload :VersionedFile,             "amp-git/repository/git/repo_format/versioned_file.rb"
        autoload :VersionedWorkingFile,      "amp-git/repository/git/repo_format/versioned_file.rb"
      end
      const_set(:Git, git)
      Core.class_eval do
        Repositories.class_eval do
          git = Module.new do
            autoload :LocalRepository,         "amp/repository/git/repositories/local_repository.rb"
            autoload :GitPicker,               "amp/repository/git/repository.rb"
            autoload :StagingArea,             "amp/repository/git/repo_format/staging_area.rb"
            autoload :RawObject,               "amp/repository/git/repo_format/raw_object.rb"
            autoload :LooseObject,             "amp/repository/git/repo_format/loose_object.rb"
            autoload :TreeObject,              "amp/repository/git/repo_format/tree_object.rb"
            autoload :CommitObject,            "amp/repository/git/repo_format/commit_object.rb"
            autoload :TagObject,               "amp/repository/git/repo_format/tag_object.rb"
            autoload :PackFile,                "amp/repository/git/repo_format/packfile.rb"
            autoload :PackFileIndex,           "amp/repository/git/repo_format/packfile_index.rb"
            autoload :PackFileIndexV1,         "amp/repository/git/repo_format/packfile_index.rb"
            autoload :PackFileIndexV2,         "amp/repository/git/repo_format/packfile_index.rb"
            autoload :Index,                   "amp/repository/git/repo_format/index.rb"
            encoding = Module.new do
              autoload :BinaryDelta,           "amp/repository/git/encoding/binary_delta.rb"
            end
            const_set(:Encoding, encoding)
          end
          const_set(:Git, git)
        end
      end
    end
  end
end
