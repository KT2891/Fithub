module Seeds
  class TrainingMenus
    def self.create()
      training_menu_data = YAML.load_file(Rails.root.join("db", "seeds", "training_menus.yml"))

      training_menu_data.each do |training_menu|
        TrainingMenu.create!(
          name: training_menu["name"],
          explanation: training_menu["explanation"],
          status: 0
          )
          puts "[Seeds] Created training menu #{training_menu["name"]}"
      end
    end
  end
end