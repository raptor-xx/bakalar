# Czech translation file for Rails internalization demo app at http://i18n-demo.phusion.nl/
# Translation by Karel Minařík (karmi@karmi.cz)
# From http://github.com/jana4u/cute_admin_example/tree/master/config/locales/cz.rb
 
{ :cz => {
   :please_log_in => 'Prosím zalogujte se',
   :name => 'Jméno:',
   :password => 'Heslo:',
   :Login => 'Přihlášení',
 
    # ActiveSupport
    :support => {
      :array => {
        :sentence_connector => 'a',
        :skip_last_comma => true
      }
    },
 
    # Date
    :date => {
      :formats => {
        :default => "%d. %m. %Y",
        :short   => "%d %b",
        :long    => "%d. %B %Y",
      },
      :day_names         => %w{Sobota Neděle Pondělí Úterý Středa Čtvrtek Pátek},
      :abbr_day_names    => %w{So Ne Po Út St Čt Pá},
      :month_names       => %w{~ Leden Únor Březen Duben Květen Červen Červenec Srpen Září Říjen Listopad Prosinec},
      :abbr_month_names  => %w{~ Led Úno Bře Dub Kvě Čvn Čvc Srp Zář Říj Lis Pro},
      :order             => [:day, :month, :year]
    },
 
    # Time
    :time => {
      :formats => {
        :default => "%a %d. %B %Y %H:%M %z",
        :short   => "%d. %m. %H:%M",
        :long    => "%A %d. %B %Y %H:%M",
        :medium  => "%d. %m. %Y %H:%M",
        :time_only => "%H:%M",
      },
      :am => 'am',
      :pm => 'pm'
    },
 
    # Numbers
    :number => {
      :format => {
        :precision => 3,
        :separator => ',',
        :delimiter => ' '
      },
      :currency => {
        :format => {
          :unit => 'Kč',
          :precision => 2,
          :format    => '%n %u',
          :separator => ",",
          :delimiter => " ",
        }
      },
      :human => {
        :format => {
          :precision => 1
        }
      },
      :percentage => {
        :format => {
        }
      },
      :precision => {
        :format => {
        }
      }
    },
 
    # Distance of time ... helper
    # NOTE: In Czech language, these values are different for the past and for the future. Preference has been given to past here.
    :datetime => {
      :distance_in_words => {
        :half_a_minute => 'půl minutou',
        :less_than_x_seconds => {
          :one => 'asi před sekundou',
          :other => 'asi před {{count}} sekundami'
        },
        :x_seconds => {
          :one => 'sekundou',
          :other => '{{count}} sekundami'
        },
        :less_than_x_minutes => {
          :one => 'před necelou minutou',
          :other => 'před ani ne {{count}} minutami'
        },
        :x_minutes => {
          :one => 'minutou',
          :other => '{{count}} minutami'
        },
        :about_x_hours => {
          :one => 'asi hodinou',
          :other => 'asi {{count}} hodinami'
        },
        :x_days => {
          :one => '24 hodinami',
          :other => '{{count}} dny'
        },
        :about_x_months => {
          :one => 'asi měsícem',
          :other => 'asi {{count}} měsíci'
        },
        :x_months => {
          :one => 'měsícem',
          :other => '{{count}} měsíci'
        },
        :about_x_years => {
          :one => 'asi rokem',
          :other => 'asi {{count}} roky'
        },
        :over_x_years => {
          :one => 'více než před rokem',
          :other => 'více než {{count}} roky'
        }
      }
    },
 
    # ActiveRecord validation messages
    :activerecord => {
      :errors => {
        :messages => {
          :inclusion           => "není v seznamu povolených hodnot",
          :exclusion           => "je vyhrazeno pro jiný účel",
          :invalid             => "není platná hodnota",
          :confirmation        => "nebylo potvrzeno",
          :accepted            => "musí být potvrzeno",
          :empty               => "nesmí být prázdný/é",
          :blank               => "je povinná položka", # alternate formulation: "is required"
          :too_long            => "je příliš dlouhá/ý (max. {{count}} znaků)",
          :too_short           => "je příliš krátký/á (min. {{count}} znaků)",
          :wrong_length        => "nemá správnou délku (očekáváno {{count}} znaků)",
          :taken               => "již databáze obsahuje",
          :not_a_number        => "není číslo",
          :greater_than        => "musí být větší než {{count}}",
          :greater_than_or_equal_to => "musí být větší nebo rovno {{count}}",
          :equal_to            => "musí být rovno {{count}}",
          :less_than           => "musí být méně než {{count}}",
          :less_than_or_equal_to    => "musí být méně nebo rovno {{count}}",
          :odd                 => "musí být liché číslo",
          :even                => "musí být sudé číslo"
        },
        :template => {
          :header   => {
            :one => "Při ukládání záznamu {{model}} došlo k chybám a nebylo jej možné uložit",
            :other => "Při ukládání záznamu {{model}} došlo ke {{count}} chybám a nebylo možné jej uložit"
          },
          :body  => "Následující pole obsahují chybně vyplněné údaje:"
        }
      },
      :models => {
        :longtime_resource => {
          :one => "Dlouhodobý majetek",
          :other => "Dlouhodobé majetky",
        },
        :customer => {
          :one => "Zákazník",
          :other => "Zákazníci",
        },
        :driver => {
          :one => "Řidič",
          :other => "Řidiči",
        },
        :employee => {
          :one => "Zaměstnanec",
          :other => "Zaměstnanci",
        },
        :company => {
          :one => "Podnik",
          :other => "Podniky",
        },
        :tiny_resource => {
          :one => "Drobný majetek",
          :other => "Drobné majetky",
        },
        :phone_number => {
          :one => "Telefonní číslo",
          :other => "Telefonní čísla",
        },
        :email => {
          :one => "Emailová adresa",
          :other => "Emailové adresy",
        },
        :journey => {
          :one => "Služební cesta",
          :other => "Služební cesty",
        },
        :cashbook => {
          :one => "Peněžní deník",
          :other => "Peněžní deníky",
        },
        :user => {
          :one => "Uživatel",
          :other => "Uživatelé",
        },
      },
      :attributes => {
        :customer => {
          :company => "Firma",
          :phone => "Telefon",
          :street_number => "Číslo popisné",
          :ICO => "Ičo",
        },
        :driver => {
          :personal_id => "Rodné číslo",
          :phone => "Telefon",
        },
        :journey => {
          :tachymetr_before => "Tachometr před",
          :tachymetr_after => "Tachometr po",
        },
        :cashbook => {
          :amount => "Částka",
          :order => "Pořadové číslo záznamu",
        },
        :user => {
          :name => "Uživatelské jméno",
          :password  => "Heslo",
        },
        :longtime_resource => {
          :name => "Název",
          :initial_value => "Pořizovací cena",
          :first_rate  => "Prvotní odpisová sazba",
          :continue_rate => "Pokračovací odpisová sazba",
        },
        :tiny_resource => {
          :name => "Název",
          :order => "Číslo",
          :initial_value  => "Pořizovací cena",
        },
        :employee => {
          :employee_number => "Zaměstnanecké číslo",
          :first_name => "Křestní jméno",
          :last_name => "Příjmení",
          :age => "Věk",
          :street => "Ulice",
          :house_number => "Číslo domu",
          :city => "Město",
          :zip_code => "PSČ",
          :country => "Země",
          :note => "Poznámka",
          :manager => "Manažer",
          :created_at => "Vytvořeno",
          :updated_at => "Změněno",
        },
        :company => {
          :name => "Název",
          :website => "Webová stránka",
          :street => "Ulice",
          :house_number => "Číslo domu",
          :city => "Město",
          :zip_code => "PSČ",
          :country => "Země",
          :created_at => "Vytvořeno",
          :updated_at => "Změněno",
        },
        :phone_number => {
          :phone_number => "Telefonní číslo",
          :created_at => "Vytvořeno",
          :updated_at => "Změněno",
        },
        :email => {
          :email => "Emailová adresa",
          :created_at => "Vytvořeno",
          :updated_at => "Změněno",
        },
      }
    },
 
    :railties => {
      :scaffold => {
        :listing => "{{model}} &ndash; přehled",
        :new => "{{model}} &ndash; nový záznam",
        :editing => "{{model}} &ndash; úprava záznamu",
        :show => "Zobrazit",
        :edit => "Upravit",
        :destroy => "Odstranit",
        :confirmation => "Jste si jist(a)?",
        :back => "Zpět",
        :create => "Vytvořit",
        :update => "Uložit",
        :created_success => "{{model}} &ndash; záznam byl vytvořen",
        :updated_success => "{{model}} &ndash; změny byly uloženy",
        :new_record => "Nový záznam",
        :filter => "Filtrovat",
        :all => "[ vše ]",
        :choose => "[ zvolte ]",
        :destroy_confirmation => "Opravdu odstranit '{{record}}'?",
        :total => "Celkem záznamů",
        :per_page => "Stránkovat po",
        :page => "Stránka",
        :next_page => "Následující",
        :prev_page => "Předchozí",
        :true => "Ano",
        :false => "Ne",
        :default_view => "Výchozí zobrazení",
      }
    },
 
    # Static texts
    :txt => {
      :choose_language => "Zvolte jazyk",
      :example => "ukázka",
      :more => "Více informací o plug-inu cute_admin naleznete na",
      :get_example => "Tuto ukázkovou aplikaci můžete získat na",
    }
  }
}