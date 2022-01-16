import Head from 'next/head'
import Image from 'next/image'
import styles from '../styles/Home.module.css'
import { supabase } from '../utils/supabaseClient'
import { PrismaClient } from '.prisma/client'
import { getLeagues } from '../utils/prismaQuery'


export default function Home({eventor}) {

  return (
    <>
   <h1 className='center justify-center flex text-green-500'>my supabase app</h1>
     {eventor.map(league => <h1 key={league.id}>{league.title}</h1>)}   
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

export async function getStaticProps(){

  const data = await getLeagues()
  return {
    
  props: {

    eventor: data
  }


}
}
