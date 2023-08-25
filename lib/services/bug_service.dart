
import '../models/bug.dart';

class BugService {

  List<Bug> getAllBugs() => List.from(_bugs);

  void addBug(Bug bug) => _bugs.add(bug);

  final List<Bug> _bugs = [
    Bug(title: "Printer Paper Jam", product: "PrintMaster", description: "Printer frequently experiences paper jams.", severity: "Medium", status: "Open", comments: [], ccUsers: ["joyce@example.com"]),
    Bug(title: "Network Connectivity Issues", product: "NavMaster", description: "Wi-Fi connection drops intermittently.", severity: "High", status: "Open", comments: [], ccUsers: ["anna@example.com", "jhope@bts.com"]),
    Bug(title: "Smartphone Overheating", product: "SmartGadget", description: "Phone gets extremely hot during usage.", severity: "High", status: "Open", comments: [], ccUsers: ["david@example.com", "jin@bts.com", "emily@example.com"]),
    Bug(title: "Email Sync Error", product: "DataSync Pro", description: "Emails not syncing properly with the server.", severity: "Medium", status: "Open", comments: [], ccUsers: ["kevin@example.com"]),
    Bug(title: "Software Crashes on Launch", product: "Mojango", description: "The software crashes immediately upon launch.", severity: "High", status: "Open", comments: [], ccUsers: ["chris@example.com", "v@bts.com"]),
    Bug(title: "Missing Features in App", product: "ShopCart", description: "App lacks expected features.", severity: "Low", status: "Open", comments: [], ccUsers: []),
    Bug(title: "Web Page Layout Issue", product: "WebWatch", description: "Web pages display incorrectly in some browsers.", severity: "Medium", status: "Open", comments: [], ccUsers: ["natalie@example.com"]),
    Bug(title: "GPS Inaccuracy", product: "NavMaster", description: "GPS location accuracy is inconsistent.", severity: "Medium", status: "Open", comments: [], ccUsers: ["michael@example.com", "jhope@bts.com"]),
    Bug(title: "Data Sync Failure", product: "DataSync Pro", description: "Data fails to sync across devices.", severity: "High", status: "Open", comments: [], ccUsers: ["olivia@example.com", "jin@bts.com", "keith@example.com"]),
    Bug(title: "Video Playback Error", product: "VideoVista", description: "Videos won't play and show error messages.", severity: "Medium", status: "Open", comments: [], ccUsers: ["william@example.com", "rm@bts.com"]),
    Bug(title: "Payment Processing Issue", product: "ShopCart", description: "Payment processing errors during checkout.", severity: "High", status: "Open", comments: [], ccUsers: ["lucas@example.com", "v@bts.com", "nancy@example.com"]),
    Bug(title: "Camera Focus Problem", product: "CamFocus", description: "Camera fails to focus properly on subjects.", severity: "Medium", status: "Open", comments: [], ccUsers: ["emma@example.com", "jimin@bts.com", "robert@example.com"]),
    Bug(title: "Search Results Incorrect", product: "WebWatch", description: "Search results are inaccurate or irrelevant.", severity: "Low", status: "Open", comments: [], ccUsers: ["grace@example.com"]),
    Bug(title: "Broken Links on Website", product: "WebWatch", description: "Website contains broken or missing links.", severity: "Low", status: "Open", comments: [], ccUsers: ["victor@example.com", "jhope@bts.com"]),
    Bug(title: "Incorrect Currency Conversion", product: "NavMaster", description: "Currency conversion rates are incorrect.", severity: "Medium", status: "Open", comments: [], ccUsers: ["andrew@example.com", "jin@bts.com"]),
    Bug(title: "Missing Calendar Events", product: "SmartGadget", description: "Calendar events are disappearing.", severity: "High", status: "Open", comments: [], ccUsers: ["oliver@example.com", "rm@bts.com"]),
    Bug(title: "Audio Distortion", product: "MusicMixer", description: "Audio playback has distortion issues.", severity: "Low", status: "Open", comments: [], ccUsers: ["dylan@example.com", "v@bts.com"]),
    Bug(title: "Mojango App Crashes", product: "Mojango", description: "Mojango app crashes frequently on startup.", severity: "High", status: "Open", comments: [], ccUsers: ["hannah@example.com", "jimin@bts.com"]),
    Bug(title: "PrintMaster Paper Feed Issue", product: "PrintMaster", description: "Paper feed problems in the PrintMaster.", severity: "Low", status: "Open", comments: [], ccUsers: ["karen@example.com", "peter@example.com"]),
    Bug(title: "Smartphone Battery Drain", product: "SmartGadget", description: "Excessive battery drain on the smartphone.", severity: "Medium", status: "Open", comments: [], ccUsers: ["steven@example.com"]),
    Bug(title: "Web Page Broken Images", product: "WebWatch", description: "Images not loading on web pages.", severity: "Low", status: "Open", comments: [], ccUsers: []),
    Bug(title: "Video Playback Freezing", product: "VideoVista", description: "Videos freeze during playback.", severity: "Medium", status: "Open", comments: [], ccUsers: ["nancy@example.com"]),
    Bug(title: "Navigation App Crashes", product: "NavMaster", description: "Navigation app crashes during routes.", severity: "High", status: "Open", comments: [], ccUsers: ["sophia@example.com", "jimin@bts.com"]),
    Bug(title: "ShopCart Cart Empty Issue", product: "ShopCart", description: "Shopping cart shows as empty despite items added.", severity: "Medium", status: "Open", comments: [], ccUsers: ["lucas@example.com"]),
    Bug(title: "Camera Not Saving Photos", product: "CamFocus", description: "Camera app not saving photos taken.", severity: "Medium", status: "Open", comments: [], ccUsers: ["keith@example.com"]),
    Bug(title: "Web Page Loading Slowly", product: "WebWatch", description: "Web pages loading very slowly.", severity: "Medium", status: "Open", comments: [], ccUsers: ["grace@example.com"]),
    Bug(title: "GPS Location Incorrect", product: "NavMaster", description: "GPS shows incorrect location information.", severity: "High", status: "Open", comments: [], ccUsers: ["hannah@example.com"]),
    Bug(title: "DataSync Pro Sync Error", product: "DataSync Pro", description: "DataSync Pro shows sync error messages.", severity: "High", status: "Open", comments: [], ccUsers: ["susan@example.com"]),
    Bug(title: "MusicMixer Playlist Error", product: "MusicMixer", description: "Playlists not functioning correctly in MusicMixer.", severity: "Medium", status: "Open", comments: [], ccUsers: ["dylan@example.com"]),
    Bug(title: "Mojango App Login Issue", product: "Mojango", description: "Users unable to login to the Mojango app.", severity: "High", status: "Open", comments: [], ccUsers: ["karen@example.com", "peter@example.com", "jhope@bts.com"])

  ];
}
