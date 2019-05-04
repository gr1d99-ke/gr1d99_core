module Gr1d99Core
  class JWTConfig
    attr_reader :key, :verify, :algorithm, :exp

    def initialize(opts)
      @key       = opts.fetch(:key)
      @verify    = opts.fetch(:verify)
      @algorithm = opts.fetch(:algorithm)
      @exp       = opts.fetch(:exp)
    end
  end
end
