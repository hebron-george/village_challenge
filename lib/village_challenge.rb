require 'village_challenge/version'
require 'village_challenge/family_generator'

module VillageChallenge
  class << self
    # Creates *number_of_families* families
    def simulate_families(number_of_families)
      validate_number_of_families!(number_of_families)
      families = []

      number_of_families.times { families << FamilyGenerator.generate!(config) }
      families
    end

    # Returns ratio of boys to girls
    # for a given array of families
    def boys_to_girls(families)
      num_boys     = families.map { |family| family[:num_boys]  }.sum
      num_girls    = families.map { |family| family[:num_girls] }.sum

      num_boys.to_f / num_girls.to_f
    end

    # Returns average number of kids
    # for a given array of families
    def average_kids_per_family(families)
      num_families = families.count
      num_kids     = families.map { |family| family[:total_children] }.sum

      num_kids.to_f / num_families.to_f
    end

    # Returns average number of boys
    # for a given array of families
    def average_boys_per_family(families)
      num_families = families.count
      num_boys     = families.map { |family| family[:num_boys] }.sum

      num_boys.to_f / num_families.to_f
    end

    # Returns average number of girls
    # for a given array of families
    def average_girls_per_family(families)
      num_families = families.count
      num_girls    = families.map { |family| family[:num_girls] }.sum

      num_girls.to_f / num_families.to_f
    end

    # Assumptions and constants
    # given in the challenge
    def config
      {
          terminating_sex:                   :boy,
          percent_families_wanting_children: 0.75,
          chance_of_having_another_child:    0.25,
          min_num_of_families:               10,
      }
    end

    def validate_number_of_families!(number_of_families)
      raise 'Non-Integer value given for number of families to generate' unless number_of_families.is_a? Integer
      raise "Minimum number of families: #{config[:min_num_of_families]}" if number_of_families < config[:min_num_of_families]
    end
  end
end
