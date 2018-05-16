
module VillageChallenge
  class FamilyGenerator

    attr_reader :config, :children

    GIRL        = :girl
    BOY         = :boy

    def self.generate!(config)
      new(config).to_hash
    end

    def initialize(config)
      @config   = config
      @children = []
      @chance_of_having_a_baby = 1 # Start with 100% chance

      have_children!
    end

    def to_hash
      {
          children:  children,
          num_girls: children.count(GIRL),
          num_boys:  children.count(BOY),
          total_children: children.count,
      }
    end

    private

    def have_children!
      return unless want_to_have_children?

      have_first_child!

      while can_have_another_child?
        have_child!
      end
    end

    def have_child!
      @children << random_sex_baby
    end

    # This is a special case because, every
    # the chance of having a subsequent child
    # after the first will vary
    def have_first_child!
      @children << random_sex_baby
    end

    def want_to_have_children?
      percent_want = config[:percent_families_wanting_children]
      Random.rand <= percent_want
    end

    def can_have_another_child?
      return false if has_child_of_terminating_sex?
      return false if can_have_subsequent_child?
      true
    end

    def can_have_subsequent_child?
      Random.rand <= @chance_of_having_a_baby
    end

    def has_child_of_terminating_sex?
      children.count(config[:terminating_sex]) > 0
    end

    def random_sex_baby
      @chance_of_having_a_baby *= config[:chance_of_having_another_child]
      Random.rand > 0.5 ? GIRL : BOY
    end
  end
end