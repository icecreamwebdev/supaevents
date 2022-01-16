import Head from 'next/head'
import Image from 'next/image'
import styles from '../styles/Home.module.css'
import { supabase } from '../utils/supabaseClient'


export default function Home({sports, leagues}) {
  return (
    <>
   <h1 className='center justify-center flex text-green-500'>my supabase app</h1>      
   </>
  )
}

// export async function getServerSideProps(){

//   const sportData = await supabase
//   .from('Sport')
//   .select()

//   const leagueData = await supabase
//   .from('League')
//   .select(`
//     title,
//       Sport (
//         title
//       )
//   `)

 
//   const sports =  await sportData
//   const leagues =  await leagueData
 
  
//   console.log(leagues.body[0].Sport.title)



//   return {

//     props: { 
//       sports,
//       leagues,
//     }
//   }
// }
