module Seeds
  class TrainingParts
    def self.create()
      training_part_data = YAML.load_file(Rails.root.join("db", "seeds", "training_parts.yml"))

      training_part_data.each do |training_part|
        TrainingPart.create!(
          training_menu_id: training_part["training_id"],
          training_part: training_part["body_parts"]
          )
          puts "[Seeds] Created training part #{training_part["name"]}"
      end
    end
  end
end