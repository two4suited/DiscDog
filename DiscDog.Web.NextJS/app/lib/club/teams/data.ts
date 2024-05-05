import { API_URL } from "../../constants";

export async function getTeams() {
 
    //const res = await fetch(`${API_URL}/weatherforecast`)
    const res = await fetch(`${API_URL}/club/1/teams`,{ cache: 'no-store' })  
    const teams: team[] = await res.json();
   
    if (!res.ok) {
      // This will activate the closest `error.js` Error Boundary
      throw new Error('Failed to fetch data')
    }
  
    return teams
  }



