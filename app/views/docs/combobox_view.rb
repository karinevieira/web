# frozen_string_literal: true

class Docs::ComboboxView < ApplicationView
  @@code_example = nil

  def view_template
    component = "Combobox"
    div(class: "max-w-2xl mx-auto w-full py-10 space-y-10") do
      render Docs::Header.new(title: component, description: "Autocomplete input and command palette with a list of suggestions.")

      Heading(level: 2) { "Usage" }

      render Docs::VisualCodeExample.new(title: "Single option", context: self) do
        <<~RUBY
          div class: "w-96" do
            Combobox do
              ComboboxTrigger placeholder: "Pick value"

              ComboboxPopover do
                ComboboxSearchInput(placeholder: "Pick value or type anything")

                ComboboxList do
                  ComboboxEmptyState { "No result" }

                  ComboboxListGroup label: "Fruits" do
                    ComboboxItem do
                      ComboboxRadio(name: "food", value: "apple")
                      span { "Apple" }
                    end

                    ComboboxItem do
                      ComboboxRadio(name: "food", value: "banana")
                      span { "Banana" }
                    end
                  end

                  ComboboxListGroup label: "Vegetable" do
                    ComboboxItem do
                      ComboboxRadio(name: "food", value: "brocoli")
                      span { "Broccoli" }
                    end

                    ComboboxItem do
                      ComboboxRadio(name: "food", value: "carrot")
                      span { "Carrot" }
                    end
                  end

                  ComboboxListGroup label: "Others" do
                    ComboboxItem do
                      ComboboxRadio(name: "food", value: "chocolate")
                      span { "Chocolate" }
                    end

                    ComboboxItem do
                      ComboboxRadio(name: "food", value: "milk")
                      span { "Milk" }
                    end
                  end
                end
              end
            end
          end
        RUBY
      end

      render Docs::VisualCodeExample.new(title: "Multiple options", context: self) do
        <<~RUBY
          div class: "w-96" do
            Combobox term: "things" do
              ComboboxTrigger placeholder: "Pick value"

              ComboboxPopover do
                ComboboxSearchInput(placeholder: "Pick value or type anything")

                ComboboxList do
                  ComboboxEmptyState { "No result" }

                  ComboboxItem do
                    ComboboxCheckbox(
                      name: "all",
                      value: "all",
                      data: {
                        ruby_ui__combobox_target: "parent",
                        action: "change->ruby-ui--combobox#toggleChilden"
                      }
                    )
                    span { "Select all" }
                  end

                  ComboboxListGroup label: "Fruits" do
                    ComboboxItem do
                      ComboboxCheckbox(
                        name: "food",
                        value: "apple",
                        data: {
                          ruby_ui__combobox_target: "child",
                          action: "change->combobox#toggleParent"
                        }
                      )
                      span { "Apple" }
                    end

                    ComboboxItem do
                      ComboboxCheckbox(
                        name: "food",
                        value: "banana",
                        data: {
                          ruby_ui__combobox_target: "child",
                          action: "change->combobox#toggleParent"
                        }
                      )
                      span { "Banana" }
                    end
                  end

                  ComboboxListGroup label: "Vegetable" do
                    ComboboxItem do
                      ComboboxCheckbox(
                        name: "food",
                        value: "brocoli",
                        data: {
                          ruby_ui__combobox_target: "child",
                          action: "change->combobox#toggleParent"
                        }
                      )
                      span { "Broccoli" }
                    end

                    ComboboxItem do
                      ComboboxCheckbox(
                        name: "food",
                        value: "carrot",
                        data: {
                          ruby_ui__combobox_target: "child",
                          action: "change->combobox#toggleParent"
                        }
                      )
                      span { "Carrot" }
                    end
                  end

                  ComboboxListGroup label: "Others" do
                    ComboboxItem do
                      ComboboxCheckbox(
                        name: "food",
                        value: "chocolate",
                        data: {
                          ruby_ui__combobox_target: "child",
                          action: "change->combobox#toggleParent"
                        }
                      )
                      span { "Chocolate" }
                    end

                    ComboboxItem do
                      ComboboxCheckbox(
                        name: "food",
                        value: "milk",
                        data: {
                          ruby_ui__combobox_target: "child",
                          action: "change->combobox#toggleParent"
                        }
                      )
                      span { "Milk" }
                    end
                  end
                end
              end
            end
          end
        RUBY
      end

      render Components::ComponentSetup::Tabs.new(component_name: "Combobox")

      render Docs::ComponentsTable.new(component_files("Combobox"))
    end
  end
end
