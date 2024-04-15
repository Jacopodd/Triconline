package control;

import model.Orario;
import model.Prenotazione;
import model.dao.PrenotazioneDAO;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class CalendarUtils {

    //UTENTE
    public static boolean isWeekend(LocalDate day) {
        if (day.getDayOfWeek().getValue() == DayOfWeek.SATURDAY.getValue() || day.getDayOfWeek().getValue() == DayOfWeek.SUNDAY.getValue())
            return true;
        else return false;
    }

    public static List<Prenotazione> getDisponibilitaGiorno(int year, int month, int day, List<Prenotazione> prenotazioni) {
        List<Prenotazione> prenotazioniGiorno = new ArrayList<>();
        //System.out.println("GIORNO ATTUALE: " + day + "/" + month + "/" + year);
        for(Prenotazione p : prenotazioni) {
            String[] giorno = p.getGiorno().split("/");
            //System.out.println("PRENOTAZIONE " + giorno[0] + "/" + giorno[1] + "/" + giorno[2]);
            if((day == Integer.parseInt(giorno[0]))) prenotazioniGiorno.add(p);
        }

        //System.out.println("PRENOTAZIONI GIORNO: " + day + " = " + prenotazioniGiorno.size());

        return prenotazioniGiorno;
    }

    public static List<Orario> getOrariDisponibili(List<Prenotazione> prenotazioni, List<Orario> orari) {
        List<Orario> orariDisponibili = new ArrayList<>();

        orariDisponibili.addAll(orari);

        Set<Integer> idOrariDaRimuovere = new HashSet<>();

        // Scansioniamo le prenotazioni e aggiungiamo gli ID degli orari corrispondenti al set
        for (Prenotazione p : prenotazioni) {
            idOrariDaRimuovere.add(p.getOrario().getId());
        }

        // Creiamo una lista temporanea per tenere traccia degli orari da rimuovere
        List<Orario> orariDaRimuovere = new ArrayList<>();

        // Scansioniamo gli orari e aggiungiamo quelli da rimuovere alla lista temporanea
        for (Orario o : orari) {
            if (idOrariDaRimuovere.contains(o.getId())) {
                orariDaRimuovere.add(o);
            }
        }

        // Rimuoviamo gli orari dalla lista orariDisponibili utilizzando la lista temporanea
        orariDisponibili.removeAll(orariDaRimuovere);

        /*System.out.println("SIZE ORARI: " +orari.size());
        System.out.println("SIZE ORARI: " +orari.size());
        if (!prenotazioni.isEmpty() && orariDisponibili != null) {
            for(Prenotazione p : prenotazioni) { //0
                for(Orario o : orari) {
                    if(o.getId() == p.getOrario().getId()) {
                        orariDisponibili.remove(o);
                    }
                }
            }
        }*/

        System.out.println("PROVAAAAAAAAAAAAAAA SIZE ORARI DIPONIBILI: " + orariDisponibili.size());
        for (Orario o : orariDisponibili) {
            System.out.println(o.getInizio() + " - " + o.getFine());
        }

        return orariDisponibili;
    }

    //SERVER
    public static List<Prenotazione> getPrenotazioniByMese(int month) {
        List<Prenotazione> listaPrenotazioni = PrenotazioneDAO.doRetrieveAll();
        List<Prenotazione> prenotazioniMese = new ArrayList<>();
        //System.out.println("MESE PASSATO COME PARAMETRO: " + month);
        if (listaPrenotazioni != null) {
            for(Prenotazione p : listaPrenotazioni) {
                int mese = Integer.parseInt(p.getGiorno().split("/")[1]);
                //System.out.println("MESE " + p.getId() + ": " + mese);
                if(mese == month) prenotazioniMese.add(p);
            }
        }

        return prenotazioniMese;
    }

    //ADMIN
}
