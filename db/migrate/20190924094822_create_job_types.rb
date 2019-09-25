class CreateJobTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :job_types do |t|
      t.string :name

      t.timestamps
    end

    job_types = [
                  'Akademisk arbejde', 
                  'Bygge og anlæg', 
                  'Design, formgivning og grafisk arbejde', 
                  'Elever', 
                  'Hotel, restauration, køkken, kantine', 
                  'Industriel produktion', 
                  'It og teleteknik', 
                  'Jern, metal og auto',
                  'Kontor, administration, regnskab og finans', 
                  'Landbrug, skovbrug, gartneri, fiskeri og dyrepleje',
                  'Ledelse',
                  'Medie, kultur, turisme, idræt og underholdning',
                  'Nærings- og nydelsesmiddel',
                  'Pædagogisk, socialt og kirkeligt arbejde',
                  'Rengøring, ejendomsservice og renovation',
                  'Salg, indkøb og markedsføring',
                  'Sundhed, omsorg og personlig pleje',
                  'Tekstil og beklædning',
                  'Transport, post, lager- og maskinførerarbejde',
                  'Træ, møbel, glas og keramik',
                  'Undervisning og vejledning', 
                  'Vagt, sikkerhed og overvågning'
                ]

    job_types.each do |jt|
      JobType.where(name: jt).first_or_create
    end
  end
end
